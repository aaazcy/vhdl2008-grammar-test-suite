-- =============================================================
-- Case ID: TC_LABEL_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SMN_LABEL_DUPLICATE
-- Standard Reference: IEEE 1076-2008 Section 10.8
-- Rule Description: Sequential statement labels must be unique within their enclosing declarative region
-- Case Type: Negative
-- Error Category: duplicate_label
-- Test Focus: SMN: duplicate statement label used in the same process — L1: null; appears twice, statement labels must be unique within the same declarative region
-- Expected Result: Triggers analysis error: identifier "l1" already used for a declaration
-- Dependencies: None
-- =============================================================
entity label_dup_l1 is port(y:out integer); end entity;
architecture vhdl2008 of label_dup_l1 is
begin
  process is
  begin
    L1: null;
    L1: null;
    y <= 0;
    wait;
  end process;
end architecture vhdl2008;
