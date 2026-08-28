-- =============================================================
-- Case ID: TC_PACKAGE_BODY_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_BODY
-- Standard Reference: IEEE 1076-2008 Section 4.7
-- Production: package_body ::= package body package_simple_name is package_body_declarative_part end [ package body ] [ package_simple_name ] ;
-- Case Type: Positive
-- Test Focus: package_body: subprogram bodies implementing forward declarations — exercises the key role of a package body: providing the implementation (body) for subprograms declared in the package declaration
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity pkg_body_subprogram_impl is
  port (
    sum_out  : out integer;
    diff_out : out integer
  );
end entity pkg_body_subprogram_impl;

architecture test of pkg_body_subprogram_impl is
  -- Forward declarations (would be in package declaration)
  function f_add(a, b : integer) return integer;
  function f_sub(a, b : integer) return integer;

  -- Bodies (would be in package body)
  function f_add(a, b : integer) return integer is
  begin
    return a + b;
  end function;

  function f_sub(a, b : integer) return integer is
  begin
    return a - b;
  end function;

  constant C_A : integer := 42;
  constant C_B : integer := 17;
begin
  sum_out  <= f_add(C_A, C_B);
  diff_out <= f_sub(C_A, C_B);
end architecture test;
