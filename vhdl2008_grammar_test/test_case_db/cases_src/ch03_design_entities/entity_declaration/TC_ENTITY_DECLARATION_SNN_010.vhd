-- =============================================================
-- Case ID: TC_ENTITY_DECLARATION_SNN_010
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_declaration ::= entity identifier is entity_header entity_declarative_part [ begin entity_statement_part ] end [ entity ] [ entity_simple_name ] ;
-- Case Type: Negative
-- Test Focus: SNN: Interface declaration missing colon separator — in `port(x in bit)` the ":" is missing between the identifier and the type mark, verifying the parser requires a colon separator after the identifier of an interface_element
-- Expected Result: Triggers syntax error: ':' expected after interface identifier
-- Dependencies: None
-- =============================================================
entity snn_no_colon_ent is
  port(x in bit);
end entity snn_no_colon_ent;
