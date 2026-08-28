-- =============================================================
-- Case ID: TC_OPERATOR_SYMBOL_SEM_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_OPERATOR_SYMBOL
-- Standard Reference: IEEE 1076-2008 Section 9.2.1
-- Production: operator_symbol ::= string_literal
-- Case Type: Positive
-- Rule Description: When overloading an operator symbol, the same number of parameters as the predefined version (unary/binary) must be kept, and the return type after overloading must be derivable from the context
-- Test Focus: unary operator "not"/"abs" and binary operator "mod"/"rem"/"**" each overloaded correctly preserving the predefined parameter count, successful compilation proves the arity match is legal
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity op_sym_sem_002 is
  port (
    op_sel  : in  integer range 0 to 4;
    a, b    : in  integer range 0 to 15;
    result  : out integer range 0 to 255
  );
end entity op_sym_sem_002;

architecture arity_preserved of op_sym_sem_002 is
  -- Unary operators (1 parameter)
  function "not"(x : integer) return integer is
  begin return 255 - x; end function "not";

  function "abs"(x : integer) return integer is
  begin if x < 0 then return -x; else return x; end if; end function "abs";

  -- Binary operators (2 parameters)
  function "mod"(x, y : integer) return integer is
  begin return x - (x / y) * y; end function "mod";

  function "rem"(x, y : integer) return integer is
  begin return x rem y; end function "rem";

  function "**"(x, y : integer) return integer is
    variable r : integer := 1;
  begin
    for i in 1 to y loop r := r * x; end loop;
    return r;
  end function "**";

  signal tmp : integer;
begin
  with op_sel select
    tmp <= "not"(a)       when 0,
           "abs"(a - b)   when 1,
           "mod"(a, b)    when 2,
           "rem"(a, b)    when 3,
           "**"(a, 2)     when 4;
  result <= tmp;
end architecture arity_preserved;
