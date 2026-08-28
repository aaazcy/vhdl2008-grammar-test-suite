-- =============================================================
-- Case ID: TC_ARCHITECTURE_DECLARATIVE_PART_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARCHITECTURE_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 3.3.1
-- Production: architecture_declarative_part ::= { block_declarative_item }
-- Case Type: Negative
-- Test Focus: SNN: Sequential statement mixed into declarative part - an if statement (sequential statement) appears in the declarative part, if is only allowed in the statement part of a process/subprogram, verifying block_declarative_item does not include sequential_statement and the analyzer should reject this illegal mix
-- Expected Result: Triggers syntax error: sequential statement not allowed in declarative part
-- Dependencies: None
-- =============================================================
entity adp_snn5_ent is port(a:in bit; y:out bit); end entity;
architecture bh of adp_snn5_ent is
  signal s_flag:bit:='0';
  if s_flag='1' then
    signal s_bad:bit;
  end if;
begin
  y<=a;
end architecture bh;
