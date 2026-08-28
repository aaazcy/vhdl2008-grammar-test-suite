-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_BODY_DECLARATIVE_PART_SYN_001
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Production: protected_type_body_declarative_part ::=
--   { protected_type_body_declarative_item }
-- Test Focus: Zero items — empty body declarative part.
--   Tests that the grammar allows zero repetitions.
--   The protected body has no data members, only method
--   implementations that operate on input parameters alone.
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- =============================================================
entity pt_body_dp_empty is
  port (
    a     : in  integer;
    b     : in  integer;
    sum   : out integer
  );
end entity pt_body_dp_empty;

architecture rtl of pt_body_dp_empty is
  type t_adder is protected
    impure function add(x : integer; y : integer) return integer;
  end protected;
  type t_adder is protected body
    impure function add(x : integer; y : integer) return integer is
    begin
      return x + y;
    end function;
  end protected body;
  shared variable sv : t_adder;
begin
  sum <= sv.add(a, b);
end architecture rtl;
