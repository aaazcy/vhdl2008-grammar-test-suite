-- =============================================================
-- Case ID: TC_CONTEXT_DECLARATION_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONTEXT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 13.2
-- Production: context_declaration ::= context identifier is context_clause end [ context ] [ context_simple_name ] ;
-- Case Type: Positive
-- Test Focus: nesting with context_reference: one context references another context — verifying the context_clause of a context_declaration contains a reference to another context, achieving layered import
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
context ctx_base is
  library ieee;
  use ieee.std_logic_1164.all;
end context ctx_base;

context ctx_nested is
  library ieee;
  context ieee.ieee_std_context;
  use ieee.numeric_std.all;
end context ctx_nested;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cd_nested_ent is
  port(
    a : in  std_logic_vector(7 downto 0);
    b : in  std_logic_vector(7 downto 0);
    y : out std_logic_vector(8 downto 0)
  );
end entity cd_nested_ent;

architecture rtl of cd_nested_ent is
begin
  y <= std_logic_vector(resize(unsigned(a),9) + resize(unsigned(b),9));
end architecture rtl;
