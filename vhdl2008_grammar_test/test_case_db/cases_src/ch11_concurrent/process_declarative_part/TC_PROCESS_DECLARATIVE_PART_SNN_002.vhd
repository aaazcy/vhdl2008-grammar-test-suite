-- =============================================================
-- Case ID: TC_PROCESS_DECLARATIVE_PART_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_PROCESS_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 11.3
-- Production: process_declarative_part ::= { process_declarative_item }
-- Case Type: Negative
-- Test Focus: process_declarative_part: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity process_declara_e2 is end entity;
architecture bh of process_declara_e2 is
  -- ERROR: invalid syntax in process_declarative_part
  signal s : bit;
begin
  s <= '1'
end architecture bh;