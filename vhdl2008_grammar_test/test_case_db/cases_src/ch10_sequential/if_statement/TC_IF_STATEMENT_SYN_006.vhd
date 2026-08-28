-- =============================================================
-- Case ID: TC_IF_STATEMENT_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_IF_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.8
-- Production: if_statement ::= [ if_label : ] if condition then sequence_of_statements { elsif condition then sequence_of_statements } [ else sequence_of_statements ] end if [ if_label ] ;
-- Case Type: Positive
-- Test Focus: If-statement inside a pure function body that computes absolute difference via if-then-else — the function `abs_diff` takes two integer arguments and the if compares them, returning (a-b) or (b-a) accordingly; demonstrates if_statement as the sole control-flow construct within a subprogram body, exercising condition-dependent return value selection without any signal/port side effects
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity if_func_absdiff_ent is port(
  x, y : in  integer range 0 to 127;
  diff : out integer range 0 to 127
); end entity;
architecture bh of if_func_absdiff_ent is
  function abs_diff(a, b : integer) return integer is
  begin
    if a > b then
      return a - b;
    else
      return b - a;
    end if;
  end function abs_diff;
begin
  process(x, y) begin
    diff <= abs_diff(x, y);
  end process;
end architecture bh;
