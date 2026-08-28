-- =============================================================
-- Case ID: TC_ITERATION_SCHEME_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_ITERATION_SCHEME
-- Standard Reference: IEEE 1076-2008 Section 10.10
-- Production: iteration_scheme ::= while condition | for parameter_specification
-- Case Type: Positive
-- Test Focus: two forms of iteration scheme coexist: for-loop (integer range enumeration) + while-loop (boolean condition with variable decrement), in the same process the two loops each use a different iteration_scheme, verifies both for and while can serve as the loop's iteration control
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity is_ent is port(lim:in integer; y:out integer); end entity;
architecture bh of is_ent is
  signal s_for:integer:=0; signal s_while:integer:=0;
begin
  process(lim)
    variable v_sum:integer:=0; variable v_rem:integer:=0;
  begin
    for i in 0 to 7 loop v_sum:=v_sum+i; end loop;
    v_rem:=lim;
    while v_rem>0 loop v_rem:=v_rem-1; v_sum:=v_sum+1; end loop;
    s_for<=v_sum; y<=s_for;
  end process;
end architecture bh;
