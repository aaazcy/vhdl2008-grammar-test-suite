-- =============================================================
-- Case ID: TC_TYPE_MARK_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_TYPE_MARK
-- Standard Reference: IEEE 1076-2008 Section 6.3
-- Production: type_mark ::= type_name [ 'range <>' ] | subtype_name
-- Case Type: Positive
-- Test Focus: Exercises type_mark with subtype_name referencing an IEEE standard type for a numeric comparator.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity type_mark_syn4 is
  port (
    a      : in  integer range 0 to 255;
    b      : in  integer range 0 to 255;
    a_gt_b : out bit;
    a_eq_b : out bit;
    a_lt_b : out bit
  );
end entity type_mark_syn4;

architecture rtl of type_mark_syn4 is
  subtype t_byte_val is integer range 0 to 255;
  signal s_a, s_b : t_byte_val := 0;
begin
  s_a <= a;
  s_b <= b;
  a_gt_b <= '1' when s_a > s_b else '0';
  a_eq_b <= '1' when s_a = s_b else '0';
  a_lt_b <= '1' when s_a < s_b else '0';
end architecture rtl;
