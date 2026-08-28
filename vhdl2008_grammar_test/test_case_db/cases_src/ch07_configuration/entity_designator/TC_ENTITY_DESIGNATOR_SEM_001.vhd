-- =============================================================
-- Case ID: TC_ENTITY_DESIGNATOR_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_ENTITY_DESIGNATOR
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_designator ::= entity_tag [ signature ]
-- Case Type: Positive (Semantic)
-- Test Focus: Signature resolves three overloaded functions where two share identical parameter types but differ only in return type -- the signature [bit_vector, bit_vector return bit] correctly selects the bit-returning overload rather than the bit_vector-returning one, exercising the semantic disambiguation mechanism of entity_designator signatures
-- Expected Result: Compiles successfully; attribute attaches to correct overload
-- Dependencies: None
-- =============================================================
entity ed_sem_disambig is
  port(
    a, b : in  bit_vector(7 downto 0);
    y    : out bit_vector(7 downto 0);
    ovf  : out bit
  );
end entity;

architecture rtl of ed_sem_disambig is
  attribute syn_attr : string;

  -- Overload #1: returns bit_vector
  function f_chk(x, y : bit_vector(7 downto 0)) return bit_vector is
    variable v : bit_vector(7 downto 0);
  begin
    v := x xor y;
    return v;
  end function;

  -- Overload #2: same param types, returns bit (overflow check)
  function f_chk(x, y : bit_vector(7 downto 0)) return bit is
    variable v : bit;
  begin
    v := x(7) xor y(7);
    return v;
  end function;

  -- Signature [bit_vector, bit_vector return bit] disambiguates overload #2
  attribute syn_attr of f_chk
    [bit_vector, bit_vector return bit] : function is "overflow_detect";

  -- Signature [bit_vector, bit_vector return bit_vector] disambiguates overload #1
  attribute syn_attr of f_chk
    [bit_vector, bit_vector return bit_vector] : function is "xor_unit";

  signal a_r, b_r : bit_vector(7 downto 0) := X"00";
begin
  a_r <= a; b_r <= b;
  y   <= f_chk(a_r, b_r);
  ovf <= f_chk(a_r, b_r);
end architecture rtl;
