-- =============================================================
-- Case ID: TC_RETURN_STATEMENT_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_RETURN_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.13
-- Production: return_statement ::= [ label : ] return [ expression ] ;
-- Case Type: Positive
-- Test Focus: No expression in procedure: `return;` is only the return keyword plus a semicolon, verifying the correct form of return without an expression in a procedure
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity return_proc_noexpr_ent is
  port (
    threshold : in  integer range 0 to 100;
    value     : in  integer range 0 to 100;
    exceeded  : out boolean
  );
end entity return_proc_noexpr_ent;

architecture guard of return_proc_noexpr_ent is
  procedure check_limit(limit, actual : integer; signal flag : out boolean) is
  begin
    if actual > limit then
      flag <= true;
      return;  -- early return from procedure, no expression
    end if;
    flag <= false;
  end procedure;
begin
  process(threshold, value) is
  begin
    check_limit(threshold, value, exceeded);
  end process;
end architecture guard;
