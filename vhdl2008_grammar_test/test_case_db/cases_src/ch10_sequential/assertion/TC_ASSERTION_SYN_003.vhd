-- =============================================================
-- Case ID: TC_ASSERTION_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_ASSERTION
-- Standard Reference: IEEE 1076-2008 Section 10.3
-- Production: assertion ::= assert condition [ report expression ] [ severity expression ]
-- Case Type: Positive
-- Test Focus: With severity clause: assert + condition + severity warning, no report, verifying assertion can specify severity_level
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity assert_with_severity_ent is
  port (
    addr   : in  integer range 0 to 1023;
    acc    : out boolean
  );
end entity assert_with_severity_ent;

architecture check of assert_with_severity_ent is
begin
  process(addr) is
  begin
    assert addr < 1024 severity error;
    acc <= true;
  end process;
end architecture check;
