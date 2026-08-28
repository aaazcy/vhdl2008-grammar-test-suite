-- =============================================================
-- Case ID: TC_ENTITY_DESIGNATOR_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_DESIGNATOR
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_designator ::= entity_tag [ signature ]
-- Case Type: Negative
-- Test Focus: Invalid signature content — the signature contains a box token '<>' as a type mark instead of a valid type_mark identifier; signature type_marks must be valid type names, not '<>'
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity ed_snn4_ent is
  port(
    a   : in  bit_vector(7 downto 0);
    y   : out bit_vector(7 downto 0)
  );
end entity;

architecture bh of ed_snn4_ent is
  attribute impl : string;
  function f_negate(x : bit_vector(7 downto 0)) return bit_vector is
  begin return not x; end function;
  -- ERROR: '<>' is not a valid type_mark inside a signature
  attribute impl of f_negate[<> return bit_vector] : function is "invert";
  signal s : bit_vector(7 downto 0) := (others => '0');
begin
  s <= f_negate(a);
  y <= s;
end architecture bh;
