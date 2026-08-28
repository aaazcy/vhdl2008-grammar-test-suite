-- =============================================================
-- Case ID: TC_ARCHITECTURE_DECLARATIVE_PART_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARCHITECTURE_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 3.3.1
-- Production: architecture_declarative_part ::= { block_declarative_item }
-- Case Type: Negative
-- Test Focus: SNN: Declaration after begin - a signal declaration appears after the begin keyword (in the statement part) instead of the declarative part, verifying the architecture begin is the hard boundary between declarative part and statement part
-- Expected Result: Triggers syntax error: declaration not allowed after begin
-- Dependencies: None
-- =============================================================
entity adp_snn4_ent is port(a:in bit; y:out bit); end entity;
architecture bh of adp_snn4_ent is
begin
  signal s_bad:bit; y<=a;
end architecture bh;
