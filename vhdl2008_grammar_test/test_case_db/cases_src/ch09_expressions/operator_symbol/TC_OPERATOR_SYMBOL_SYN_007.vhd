-- =============================================================
-- Case ID: TC_OPERATOR_SYMBOL_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_OPERATOR_SYMBOL
-- Standard Reference: IEEE 1076-2008 Section 9.2.1
-- Production: operator_symbol ::= string_literal
-- Case Type: Positive
-- Test Focus: Matching operator overloading: VHDL 2008 string_literal "?="/"?/="/"?<"/"?<="/"?>"/"?>=" used as function names, providing matching comparisons for a custom type (can return bit/std_ulogic)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity op_sym_matching is
  port (
    a, b     : in  integer range 0 to 255;
    match_eq : out bit;
    match_ne : out bit;
    match_lt : out bit;
    match_gt : out bit
  );
end entity op_sym_matching;

architecture match_ops of op_sym_matching is
  type t_byte is range 0 to 255;

  function "?="(x, y : t_byte) return bit is
  begin if x = y then return '1'; else return '0'; end if; end function "?=";

  function "?/="(x, y : t_byte) return bit is
  begin if x /= y then return '1'; else return '0'; end if; end function "?/=";

  function "?<"(x, y : t_byte) return bit is
  begin if x < y then return '1'; else return '0'; end if; end function "?<";

  function "?>"(x, y : t_byte) return bit is
  begin if x > y then return '1'; else return '0'; end if; end function "?>";

  signal sa, sb : t_byte;
begin
  sa <= t_byte(a);
  sb <= t_byte(b);
  match_eq <= "?="(sa, sb);
  match_ne <= "?/="(sa, sb);
  match_lt <= "?<"(sa, sb);
  match_gt <= "?>"(sa, sb);
end architecture match_ops;
