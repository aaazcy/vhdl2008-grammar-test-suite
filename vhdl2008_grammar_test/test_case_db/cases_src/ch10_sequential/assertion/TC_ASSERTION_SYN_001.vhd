-- =============================================================
-- Case ID: TC_ASSERTION_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_ASSERTION
-- Standard Reference: IEEE 1076-2008 Section 10.3
-- Production: assertion ::= assert condition [ report expression ] [ severity expression ]
-- Case Type: Positive
-- Test Focus: Minimal form: only assert + boolean condition, no report, no severity
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity assert_minimal_ent is
  port (
    clk   : in  bit;
    valid : in  boolean;
    ready : out bit
  );
end entity assert_minimal_ent;

architecture minimal of assert_minimal_ent is
begin
  process(clk) is
  begin
    if clk'event and clk = '1' then
      assert valid;
      ready <= '1';
    end if;
  end process;
end architecture minimal;
