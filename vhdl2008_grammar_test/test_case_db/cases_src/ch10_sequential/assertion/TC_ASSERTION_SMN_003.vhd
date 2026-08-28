-- =============================================================
-- Case ID: TC_ASSERTION_SMN_003
-- Rule Type: Semantic
-- Related Rule ID: SMN_ASSERTION_SEVERITY
-- Standard Reference: IEEE 1076-2008 Section 10.3
-- Rule Description: Severity expression must be of type SEVERITY_LEVEL — negative variant
-- Case Type: Negative
-- Error Category: type_error
-- Test Focus: SMN: severity uses string "error" instead of enumeration literal error, verifying severity must be of severity_level type
-- Expected Result: Triggers semantic error: severity must be SEVERITY_LEVEL, not STRING
-- Dependencies: None
-- =============================================================
entity assert_sev_str_ent is
  port (data : in integer; status : out integer);
end entity assert_sev_str_ent;

architecture smn of assert_sev_str_ent is
begin
  process(data) is
  begin
    assert data >= 0
      report "data negative"
      severity "error";  -- ERROR: severity is STRING, not SEVERITY_LEVEL
    status <= data;
  end process;
end architecture smn;
