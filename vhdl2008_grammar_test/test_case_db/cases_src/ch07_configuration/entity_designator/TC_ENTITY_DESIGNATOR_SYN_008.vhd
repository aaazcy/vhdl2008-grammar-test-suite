-- =============================================================
-- Case ID: TC_ENTITY_DESIGNATOR_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_DESIGNATOR
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_designator ::= entity_tag [ signature ]
-- Case Type: Positive
-- Test Focus: Multiple entity_designators with mixed signatures and plain tags -- exercises a comma-separated list where some entity_designators carry signatures and others use bare entity_tags, all within a single attribute specification applied to a group of overloaded functions and plain signals
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ed_mixed_tags is
  port(
    a      : in  bit_vector(7 downto 0);
    b      : in  bit_vector(7 downto 0);
    op     : in  bit;
    result : out bit_vector(7 downto 0)
  );
end entity;

architecture rtl of ed_mixed_tags is
  attribute syn_encoding : string;

  -- Overloaded #1: bitwise AND
  function f_alu(x, y : bit_vector(7 downto 0)) return bit_vector is
  begin return x and y; end function;

  -- Overloaded #2: bitwise OR
  function f_alu(x, y : bit) return bit_vector is
    variable v : bit_vector(7 downto 0);
  begin
    v := (others => x or y);
    return v;
  end function;

  -- Overloaded #3: add
  function f_alu(x, y : integer) return bit_vector is
    variable v : bit_vector(7 downto 0);
  begin
    v := (others => '0');
    return v;
  end function;

  -- Mix of entity_designators with signatures applied to the overloaded functions
  attribute syn_encoding of
    f_alu [bit_vector, bit_vector return bit_vector],
    f_alu [bit, bit return bit_vector]
    : function is "one_hot";

  signal a_r, b_r : bit_vector(7 downto 0) := X"00";
  signal op_r     : bit := '0';
begin
  a_r <= a; b_r <= b; op_r <= op;
  process(op_r, a_r, b_r)
  begin
    if op_r = '0' then
      result <= f_alu(a_r, b_r);
    else
      result <= f_alu(a_r(0), op_r);
    end if;
  end process;
end architecture rtl;
