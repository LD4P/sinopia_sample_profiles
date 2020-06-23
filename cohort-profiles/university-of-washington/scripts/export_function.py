# -*- coding: utf-8 -*-
"""
Created on Mon Nov 25 12:19:43 2019

@author: alexis mcclimans
"""

# 2020-05-27 changes needed; see note at:
    # https://hackmd.io/@ries07/B1HLNF2s8

import os
import rdflib
from rdflib import *
from SPARQLWrapper import SPARQLWrapper, JSON, POST, DIGEST, N3
#import requests
#import random


"""Generate directories - program will generate a set of directories to save the exported records in"""
if not os.path.exists('export_ttl'):
    print('generating directories') #creates ttl directory
    os.makedirs('export_ttl')
if not os.path.exists('export_xml'):# creates xml directory
    os.makedirs('export_xml')

endpoint = 'http://localhost:8008/fuseki0/sin2fuseki'





"""Initializes a graph, loads in UW trellis repo, and extracts record URIS"""
print("...\nretrieving graph uris", flush=True)
G = Graph()
G.load('https://trellis.sinopia.io/repository/washington', format='turtle')

##namespace binding for easy access
LDP = Namespace('http://www.w3.org/ns/ldp#')
RDA = Namespace('http://rdaregistry.info/Elements/')
G.bind('LDP', LDP)
G.bind('RDA', RDA)
URIS = [] # list for record uris
for o in G.objects(subject=None,predicate=LDP.contains):#records are described in the parent repo using ldp.contains
    URIS.append(o)


"""For each URI in the UW trellis repo, downloads the graph, and serializes and exports in ttl and xml"""
print("...\nsaving downloaded graphs locally", flush=True)
for uri in URIS:
    label = uri.split('/')[-1] #useURI element as name
    g = Graph()
    g.load(uri,format='turtle')
    g.serialize(destination='export_ttl/'+label+'.ttl', format='turtle')#creates ttl serialization
    g.serialize(destination='export_xml/'+label+'.rdf', format='xml')#creates xml serialization
    ## to add more serialization options, create a folder for holding the exports, and update the function args
    #g.serialize(destination='exports/NEW_EXPORT_FOLDER/'+label+'.FILE_TYPE', format='RDFLIB FORMAT')



"""concatenates individual records into singular graph"""
g = Graph()
for uri in URIS:
    g.parse(uri)

"""asks for endpoint, creates a SPARQLwrapper client"""


if endpoint != '':
    sparql = SPARQLWrapper(endpoint)
    sparql.setHTTPAuth(DIGEST)
    sparql.setMethod(POST)
    print('...\nclearing graph', flush=True)

    """clears graph at endpoint"""

    sparql.setQuery("""
    DELETE {
    ?s ?p ?O
    }
    where{
    ?s ?p ?O
    }
    """)
    results = sparql.query()
    if 'succeeded' in results.response.read().decode():
        print('...\nupdate succeeded', flush=True)


    """ Updates fuseki graph with new concatenated graph"""
    print("...\nupdating fuseki", flush=True)
    sparql.setQuery("""
    INSERT DATA {
    """+g.serialize(format='nt').decode()+"""
    }
    """)
    sparql.method
    results = sparql.query().convert()

    results = sparql.query()
    if 'succeeded' in results.response.read().decode():
        print('...\nupdate succeeded', flush=True)


print('end export')
