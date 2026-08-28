-- =============================================================
-- Case ID: TC_OPERATOR_SYMBOL_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_OPERATOR_SYMBOL
-- Standard Reference: IEEE 1076-2008 Section 9.2.1
-- Production: operator_symbol ::= string_literal
-- Case Type: Positive
-- Test Focus: Relational operator overloading: string_literal "="/"/="/"<"/"<="/">"/">=" used as function names, providing all six comparisons for a custom record type
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity op_sym_relational is
  port (
    a, b   : in  integer;
    eq, ne : out boolean;
    lt, le : out boolean;
    gt, ge : out boolean
  );
end entity op_sym_relational;

architecture compare_ops of op_sym_relational is
  type t_pair is record
    lo, hi : integer;
  end record t_pair;

  function "="(x, y : t_pair) return boolean is
  begin return (x.lo = y.lo) and (x.hi = y.hi); end function "=";

  function "/="(x, y : t_pair) return boolean is
  begin return not ("="(x, y)); end function "/=";

  function "<"(x, y : t_pair) return boolean is
  begin return (x.hi < y.hi) or ((x.hi = y.hi) and (x.lo < y.lo)); end function "<";

  function "<="(x, y : t_pair) return boolean is
  begin return "<"(x, y) or "="(x, y); end function "<=";

  function ">"(x, y : t_pair) return boolean is
  begin return not "<="(x, y); end function ">";

  function ">="(x, y : t_pair) return boolean is
  begin return not "<"(x, y); end function ">=";

  signal sa, sb : t_pair;
begin
  sa <= (lo => a, hi => 0);
  sb <= (lo => b, hi => 0);
  eq <= "="(sa, sb);
  ne <= "/="(sa, sb);
  lt <= "<"(sa, sb);
  le <= "<="(sa, sb);
  gt <= ">"(sa, sb);
  ge <= ">="(sa, sb);
end architecture compare_ops;
