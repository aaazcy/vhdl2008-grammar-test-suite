-- =============================================================
-- Case ID: TC_ENTITY_DECLARATION_SYN_S03
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_declaration ::= entity identifier is entity_header entity_declarative_part [ begin entity_statement_part ] end [ entity ] [ entity_simple_name ] ;
-- Case Type: Positive
-- Test Focus: entity with buffer and linkage ports
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ent_spc3_ent is
  port(din:in bit; buf_out:buffer bit; lnk:linkage bit);
end entity ent_spc3_ent;
architecture bh of ent_spc3_ent is begin buf_out<=din; end architecture bh;
