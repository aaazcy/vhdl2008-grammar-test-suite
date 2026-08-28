-- =============================================================
-- Case ID: TC_ARCHITECTURE_DECLARATIVE_PART_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARCHITECTURE_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 3.3.1
-- Production: architecture_declarative_part ::= { block_declarative_item }
-- Case Type: Negative
-- Test Focus: SNN: Signal declaration missing colon - `signal s_bad integer;` the identifier is directly followed by the type name without ":", verifying signal_declaration requires a colon to separate identifier_list and subtype_indication
-- Expected Result: Triggers syntax error: missing ":" in signal declaration
-- Dependencies: None
-- =============================================================
entity adp_snn3_ent is port(a:in bit; y:out bit); end entity;
architecture bh of adp_snn3_ent is
  signal s_bad integer;
begin y<=a; end architecture bh;
