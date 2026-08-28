-- =============================================================
-- Case ID: TC_SUBPROGRAM_STATEMENT_PART_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_STATEMENT_PART
-- Standard Reference: IEEE 1076-2008 Section 4.2
-- Production: subprogram_statement_part ::= { sequential_statement }
-- Case Type: Positive
-- Test Focus: subprogram_statement_part: single return statement (minimum statement part) — exercises the minimal non-empty case where { sequential_statement } contains exactly one statement: a return
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity subprog_stmt_minimal is
  port (
    val_in  : in  bit;
    val_out : out bit
  );
end entity;

architecture test of subprog_stmt_minimal is
  -- subprogram_statement_part: single sequential_statement (return)
  function f_identity(b : bit) return bit is
  begin
    return b;
  end function;
begin
  val_out <= f_identity(val_in);
end architecture test;
