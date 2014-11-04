% Some prolog scripts to get GTAA from OpenSkos OAI
%
:- use_module([ library(xmlrdf/xmlrdf),
		library(semweb/rdf_cache),
		library(semweb/rdf_library),
		library(semweb/rdf_turtle_write)
	      ]).
:- use_module(rewrite_gtaa).



load_oai:-
	rdf_load('C:/Users/vdboer/git/oai/oai.ttl'),
	['C:/Users/vdboer/git/oai/oairdf.pl'].


load_gtaa:-
	rdf_load('C:/Users/vdboer/cp-test/gtaa_sample.ttl',[graph(data)]).



crawl_gtaa:-
	oai_crawl('http://openskos.org/oai-pmh',
			'C:/Users/vdboer/cp-test/gtaa.ttl',
			 [metadataPrefix('oai_rdf'),
			 set('beg:gtaa')]).



