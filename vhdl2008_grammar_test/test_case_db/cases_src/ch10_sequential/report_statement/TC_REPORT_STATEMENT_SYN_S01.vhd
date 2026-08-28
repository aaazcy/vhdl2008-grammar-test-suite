-- =============================================================
-- Case ID: TC_REPORT_STATEMENT_SYN_S01
-- Rule Type: Syntax
-- Related Rule ID: BNF_REPORT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.3
-- Production: report_statement ::= [ label : ] report expression [ severity expression ] ;
-- Case Type: Positive (Production-Specific)
-- Test Focus: Production-specific: report inside a function — using a report statement in a pure function to output debug information, verifying the usability of report in subprograms
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity report_in_func_ent is
  port (
    op_a  : in  integer range 0 to 15;
    op_b  : in  integer range 0 to 15;
    prod  : out integer range 0 to 225
  );
end entity report_in_func_ent;

architecture multiply of report_in_func_ent is
  impure function debug_multiply(x, y : integer) return integer is
  begin
    report "multiply: " & integer'image(x) & " * " & integer'image(y)
      severity note;
    return x * y;
  end function;
begin
  process(op_a, op_b) is
  begin
    prod <= debug_multiply(op_a, op_b);
  end process;
end architecture multiply;
