:- module(rewrite_gtaa,
	  [ rewrite/0,
	    rewrite/1,
	    rewrite/2,
	    list_rules/0
	  ]).
:- use_module(library(semweb/rdf_db)).
:- use_module(library(xmlrdf/rdf_convert_util)).
:- use_module(library(xmlrdf/cvt_vocabulary)).
:- use_module(library(xmlrdf/rdf_rewrite)).
:- use_module(library(http/http_open)).

:- debug(rdf_rewrite).

%%	rewrite
%
%	Apply all rules on the graph =data=

rewrite :-
	rdf_rewrite(data).

%%	rewrite(+Rule)
%
%	Apply the given rule on the graph =data=

rewrite(Rule) :-
	rdf_rewrite(data, Rule).

%%	rewrite(+Graph, +Rule)
%
%	Apply the given rule on the given graph.

rewrite(Graph, Rule) :-
	rdf_rewrite(Graph, Rule).

%%	list_rules
%!
%	List the available rules to the console.

list_rules :-
	rdf_rewrite_rules.

:- discontiguous
	rdf_mapping_rule/5.

useuri
@@
{S, rdf:about, literal(URI)}\
{S}
<=>
{URI}.

predbn
@@
{S, Pred, BN},
 {BN, rdf:type, _},
{BN, rdf:resource, literal(R)}
<=>
rdf_is_bnode(BN),
{S, Pred, R}.

clean_desc
@@
{_, rdf:description, _}
<=>
true.

clean_desc
@@
{_, rdf:type, rdf:'Description'}
<=>
true.

clean_oai
@@
{_, oai:server, _}
<=>
true.

clean_oai
@@
{_, oai:datestamp, _}
<=>
true.

clean_oai
@@
{_, oai:identifier, _}
<=>
true.

clean_oai
@@
{_, rdf:type, oai:'Record'}
<=>
true.
