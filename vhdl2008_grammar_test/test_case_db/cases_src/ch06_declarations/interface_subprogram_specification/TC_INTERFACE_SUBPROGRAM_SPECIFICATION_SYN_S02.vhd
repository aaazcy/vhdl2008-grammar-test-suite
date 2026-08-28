-- =============================================================
-- Case ID: TC_INTERFACE_SUBPROGRAM_SPECIFICATION_SYN_S02
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTERFACE_SUBPROGRAM_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: interface_subprogram_specification ::= interface_procedure_specification | interface_function_specification
-- Case Type: Positive
-- Test Focus: Production-specific: exercises interface_subprogram_specification through both procedure and function paths.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity interface_subprog_spec_syn_s2 is
  port (
    a, b : in  integer;
    sum  : out integer;
    prod : out integer
  );
end entity interface_subprog_spec_syn_s2;

architecture rtl of interface_subprog_spec_syn_s2 is
  function multiply(x, y : integer) return integer is
  begin
    return x * y;
  end function;

  procedure add_proc(x, y : in integer; z : out integer) is
  begin
    z := x + y;
  end procedure;
begin
  process(a, b)
    variable v_sum : integer;
  begin
    add_proc(a, b, v_sum);
    sum  <= v_sum;
    prod <= multiply(a, b);
  end process;
end architecture rtl;
