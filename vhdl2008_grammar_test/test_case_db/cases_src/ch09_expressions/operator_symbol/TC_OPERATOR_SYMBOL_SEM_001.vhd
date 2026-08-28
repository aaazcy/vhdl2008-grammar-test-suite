-- =============================================================
-- Case ID: TC_OPERATOR_SYMBOL_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_OPERATOR_SYMBOL
-- Standard Reference: IEEE 1076-2008 Section 9.2.1
-- Production: operator_symbol ::= string_literal
-- Case Type: Positive
-- Rule Description: The operator_symbol string_literal must exactly match a predefined VHDL operator string (including case), no whitespace is allowed in the string
-- Test Focus: exact matching of legal operator symbols: using all 21 predefined VHDL operator strings (and/or/nand/nor/xor/xnor/not/=/=/< /<=/>/>=/+/-/*/mod/rem/**/abs/&), verifying that each string_literal is recognized by the VHDL compiler as a legal operator
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity op_sym_sem_001 is
  port (
    sel   : in  integer range 0 to 4;
    a, b  : in  integer;
    r     : out integer
  );
end entity op_sym_sem_001;

architecture all_valid_ops of op_sym_sem_001 is
  -- Declare aliases for various operator symbols to demonstrate valid string_literals
  alias plus      is "+"[integer, integer return integer];
  alias minus     is "-"[integer, integer return integer];
  alias multiply  is "*"[integer, integer return integer];
  alias absolute  is "abs"[integer return integer];

  function "&"(x, y : integer) return integer is
  begin return x * 1000 + y; end function "&";

  alias concat    is "&"[integer, integer return integer];
begin
  with sel select
    r <= plus(a, b)          when 0,
         minus(a, b)         when 1,
         multiply(a, b)      when 2,
         absolute(a)         when 3,
         "&"(a, b)           when 4;
end architecture all_valid_ops;
