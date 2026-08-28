-- =============================================================
-- Case ID: TC_CONDITIONAL_EXPRESSIONS_SYN_009
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITIONAL_EXPRESSIONS
-- Standard Reference: IEEE 1076-2008 Section 9.2.1
-- Production: conditional_expressions ::= expression when condition { else expression when condition } [ else expression ]
-- Case Type: Positive
-- Test Focus: conditional expression in a constant declaration: the constant value uses a when-else expression to select its initial value at declaration time based on a generic condition
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity ce_in_constant is
  generic (
    WIDTH : integer := 8
  );
  port (
    result : out integer
  );
end entity ce_in_constant;

architecture const_decl of ce_in_constant is
  function sel_limit return integer is
    variable v : integer;
  begin
    v := 255 when WIDTH = 8 else 65535 when WIDTH = 16 else 15;
    return v;
  end function sel_limit;

  constant C_LIMIT : integer := sel_limit;
begin
  result <= C_LIMIT;
end architecture const_decl;
