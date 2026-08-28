-- =============================================================
-- Case ID: TC_ASSERTION_SYN_S01
-- Rule Type: Syntax
-- Related Rule ID: BNF_ASSERTION
-- Standard Reference: IEEE 1076-2008 Section 10.3
-- Production: assertion ::= assert condition [ report expression ] [ severity expression ]
-- Case Type: Positive (Production-Specific)
-- Test Focus: Complex expressions with all clauses: assert + relational condition + report with string concatenation + severity failure, verifying all three clauses of assertion can contain any legal expression
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity assert_complex_ent is
  port (
    index    : in  integer range 0 to 15;
    mem_val  : in  bit_vector(7 downto 0);
    err_flag : out boolean
  );
end entity assert_complex_ent;

architecture validator of assert_complex_ent is
begin
  process(index, mem_val) is
    constant C_MAX_INDEX : integer := 15;
  begin
    assert (index >= 0) and (index <= C_MAX_INDEX)
      report "Assertion failed at index=" & integer'image(index)
      & " with mem_val=" & to_string(mem_val)
      severity failure;
    err_flag <= not ((index >= 0) and (index <= C_MAX_INDEX));
  end process;
end architecture validator;
