-- =============================================================
-- Case ID: TC_SUBPROGRAM_DECLARATION_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 4.2
-- Production: subprogram_declaration ::= subprogram_specification ;
-- Case Type: Positive
-- Test Focus: subprogram_declaration: function specification with parameters — exercises the BNF where subprogram_specification is a function_specification with a formal parameter list, terminated by ';'
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity subprog_decl_func is
  port (
    clk     : in  bit;
    a, b    : in  integer;
    product : out integer
  );
end entity;

architecture test of subprog_decl_func is
  -- subprogram_declaration: subprogram_specification ;
  function f_multiply(x, y : integer) return integer;

  -- subprogram_body (the implementation)
  function f_multiply(x, y : integer) return integer is
  begin
    return x * y;
  end function;

  signal s_prod : integer := 0;
begin
  process(clk) is
  begin
    if clk'event and clk = '1' then
      s_prod <= f_multiply(a, b);
    end if;
  end process;
  product <= s_prod;
end architecture test;
