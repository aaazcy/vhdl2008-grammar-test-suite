-- =============================================================
-- Case ID: TC_LABEL_SYN_S01
-- Rule Type: Syntax
-- BNF Production: LABEL
-- Standard Reference: IEEE 1076-2008 Section 10.2
-- Test Focus: Label: identifier — optional statement label for all sequential and concurrent statements
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_label_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_label_syn_s01 is
  signal s_l:integer:=0;
begin
  l_test: s_l<=1; r<=s_l;  -- labelled assignment
end architecture bh;
