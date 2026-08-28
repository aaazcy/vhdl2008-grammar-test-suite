-- =============================================================
-- Case ID: TC_SEM_SEQ_008_SMN_008
-- Rule Type: Semantic
-- Related Rule ID: SEM_SEQ_008
-- Standard Reference: IEEE 1076-2008 Section 10.9
-- Rule Description: Each expression value may be covered at most once - when an explicit OTHERS is present, other explicit values must not overlap with OTHERS
-- Case Type: Negative
-- Error Category: declaration_elaboration_error
-- Test Focus: Negative example: case has when others but every discrete value is also listed explicitly - semantically no overlap but OTHERS contains all unlisted values. This shows another duplicate pattern: two explicit choices `0` (single value and 0 or 1 cover 0 twice)
-- Expected Result: Triggers semantic error: overlapping case choices
-- Dependencies: None
-- =============================================================
entity case_smn8_ent is port(sel:in integer range 0 to 2; y:out integer); end entity;
architecture bh of case_smn8_ent is
begin
  process(sel) begin
    case sel is when 0=>y<=0; when 0|1=>y<=10; when 2=>y<=20; end case;
  end process;
end architecture bh;
