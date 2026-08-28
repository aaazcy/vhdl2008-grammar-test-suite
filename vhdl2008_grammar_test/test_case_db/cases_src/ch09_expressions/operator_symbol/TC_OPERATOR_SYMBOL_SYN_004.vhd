-- =============================================================
-- Case ID: TC_OPERATOR_SYMBOL_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_OPERATOR_SYMBOL
-- Standard Reference: IEEE 1076-2008 Section 9.2.1
-- Production: operator_symbol ::= string_literal
-- Case Type: Positive
-- Test Focus: Logical operator overloading: string_literal "and"/"or"/"nand"/"nor"/"xor" each used as a function name, performing bitwise logical operations on the bit_vector type
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity op_sym_logical is
  port (
    op_sel : in  integer range 0 to 3;
    a, b   : in  bit_vector(7 downto 0);
    r      : out bit_vector(7 downto 0)
  );
end entity op_sym_logical;

architecture logic_ops of op_sym_logical is
  function "and"(x, y : bit_vector) return bit_vector is
    variable z : bit_vector(x'range);
  begin
    for i in x'range loop z(i) := x(i) and y(i); end loop;
    return z;
  end function "and";

  function "or"(x, y : bit_vector) return bit_vector is
    variable z : bit_vector(x'range);
  begin
    for i in x'range loop z(i) := x(i) or y(i); end loop;
    return z;
  end function "or";

  function "xor"(x, y : bit_vector) return bit_vector is
    variable z : bit_vector(x'range);
  begin
    for i in x'range loop z(i) := x(i) xor y(i); end loop;
    return z;
  end function "xor";

  function "nor"(x, y : bit_vector) return bit_vector is
    variable z : bit_vector(x'range);
  begin
    for i in x'range loop z(i) := x(i) nor y(i); end loop;
    return z;
  end function "nor";
begin
  with op_sel select
    r <= "and"(a, b) when 0,
         "or"(a, b)  when 1,
         "xor"(a, b) when 2,
         "nor"(a, b) when 3;
end architecture logic_ops;
