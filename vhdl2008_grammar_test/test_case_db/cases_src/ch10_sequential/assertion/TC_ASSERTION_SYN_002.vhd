-- =============================================================
-- Case ID: TC_ASSERTION_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_ASSERTION
-- Standard Reference: IEEE 1076-2008 Section 10.3
-- Production: assertion ::= assert condition [ report expression ] [ severity expression ]
-- Case Type: Positive
-- Test Focus: With report clause: assert + condition + report string, no severity, verifying assertion can carry a string message
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity assert_with_report_ent is
  port (
    data_in  : in  integer;
    data_out : out integer
  );
end entity assert_with_report_ent;

architecture rtl of assert_with_report_ent is
begin
  process(data_in) is
  begin
    assert data_in /= 0 report "data_in is zero";
    data_out <= data_in;
  end process;
end architecture rtl;
