-- =============================================================
-- Case ID: TC_PACKAGE_BODY_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_BODY
-- Standard Reference: IEEE 1076-2008 Section 4.7
-- Production: package_body ::= package body package_simple_name is package_body_declarative_part end [ package body ] [ package_simple_name ] ;
-- Case Type: Positive
-- Test Focus: package_body: mixed declarative items (type + constant + subprogram body) — exercises multiple package_body_declarative_item variants combined in one declarative part, as would appear in a real package body
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity pkg_body_mixed_items is
  port (
    scaled_out : out real;
    valid_out  : out boolean
  );
end entity pkg_body_mixed_items;

architecture test of pkg_body_mixed_items is
  type scale_factor_t is range 1 to 256;
  subtype scale_small_t is scale_factor_t range 1 to 16;
  constant C_FACTOR : scale_factor_t := 8;
  constant C_OFFSET : real := 0.5;

  function f_scale(v : real; s : scale_factor_t) return real is
  begin
    return v * real(s) + C_OFFSET;
  end function;

  function f_is_valid(v : real) return boolean is
  begin
    return v >= 0.0 and v < 1024.0;
  end function;

  constant C_INPUT_VAL : real := 10.0;
begin
  scaled_out <= f_scale(C_INPUT_VAL, C_FACTOR);
  valid_out  <= f_is_valid(f_scale(C_INPUT_VAL, C_FACTOR));
end architecture test;
