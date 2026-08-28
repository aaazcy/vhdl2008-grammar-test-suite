-- =============================================================
-- Case ID: TC_ENTITY_STATEMENT_PART_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_STATEMENT_PART
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_statement_part ::= { entity_statement }
-- Case Type: Positive
-- Test Focus: Empty entity statement part — entity has no begin section, i.e. zero entity_statements ({ } means zero repetitions), this is the most common entity form: only port/generic and optional declarative_part, verifying begin and the following entity_statement_part are optional
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity esp_empty_ent is
  port(a:in bit; y:out bit);
end entity esp_empty_ent;
architecture bh of esp_empty_ent is
begin y<=a; end architecture bh;
