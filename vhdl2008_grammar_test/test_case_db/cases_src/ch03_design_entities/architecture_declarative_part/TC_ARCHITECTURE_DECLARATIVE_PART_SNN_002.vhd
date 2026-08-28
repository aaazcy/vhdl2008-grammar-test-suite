-- =============================================================
-- Case ID: TC_ARCHITECTURE_DECLARATIVE_PART_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARCHITECTURE_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 3.3.1
-- Production: architecture_declarative_part ::= { block_declarative_item }
-- Case Type: Negative
-- Test Focus: SNN: Type declaration missing "is" - `type t_bad range 0 to 255;` lacks the "is" keyword separating the type identifier and type_definition, verifying the syntactic completeness of type_declaration as a block_declarative_item
-- Expected Result: Triggers syntax error: missing "is" in type declaration
-- Dependencies: None
-- =============================================================
entity adp_snn2_ent is port(a:in bit; y:out bit); end entity;
architecture bh of adp_snn2_ent is
  type t_bad range 0 to 255;
  signal s:t_bad;
begin y<=a; end architecture bh;
