-- =============================================================
-- Case ID: TC_ENTITY_DESIGNATOR_SMN_001
-- Rule Type: Semantic (Negative)
-- Related Rule ID: BNF_ENTITY_DESIGNATOR
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_designator ::= entity_tag [ signature ]
-- Case Type: Negative (Semantic)
-- Test Focus: Signature matches no actual overload -- the entity_tag "f_calc" has two overloads but the signature [bit_vector return integer] specifies a return type (integer) that does not match any existing overload; this tests that signatures must correspond to an actual declaration
-- Expected Result: Triggers semantic error (no matching subprogram for signature)
-- Dependencies: None
-- =============================================================
entity ed_smn_no_match is
  port(
    x, y : in  bit_vector(3 downto 0);
    z    : out bit_vector(3 downto 0)
  );
end entity;

architecture bh of ed_smn_no_match is
  attribute syn_style : string;
  function f_calc(a, b : bit_vector(3 downto 0)) return bit_vector is
  begin return a and b; end function;
  function f_calc(a : bit_vector(3 downto 0)) return bit_vector is
  begin return not a; end function;
  -- ERROR: no overload of f_calc returns integer; signature is unresolvable
  attribute syn_style of f_calc
    [bit_vector return integer] : function is "nonexistent_sig";
  signal rx, ry : bit_vector(3 downto 0) := "0000";
begin
  rx <= x; ry <= y;
  z <= f_calc(rx, ry);
end architecture bh;
