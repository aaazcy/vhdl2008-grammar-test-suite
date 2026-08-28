-- =============================================================
-- Case ID: TC_SEM_SEQ_008_SMN_007
-- Rule Type: Semantic
-- Related Rule ID: SEM_SEQ_008
-- Standard Reference: IEEE 1076-2008 Section 10.9
-- Rule Description: Each expression value may be covered at most once in case choices - duplicate coverage triggers an elaboration error
-- Case Type: Negative
-- Error Category: declaration_elaboration_error
-- Test Focus: Negative example: in integer range 0..3, value 1 appears in both `when 1` and `when 1 or 2` (duplicate coverage), verifying the analyzer detects overlap between choices - the same value covered by two different choices
-- Expected Result: Triggers semantic error: duplicate choice value in case
-- Dependencies: None
-- =============================================================
entity case_smn7_ent is port(sel:in integer range 0 to 3; y:out integer); end entity;
architecture bh of case_smn7_ent is
begin
  process(sel) begin
    case sel is when 0=>y<=0; when 1=>y<=10; when 1|2=>y<=20; when 3=>y<=30; end case;
  end process;
end architecture bh;
