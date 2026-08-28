-- =============================================================
-- Case ID: TC_ENTITY_DESIGNATOR_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_DESIGNATOR
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_designator ::= entity_tag [ signature ]
-- Case Type: Positive
-- Test Focus: entity_tag with signature containing only return type_mark [return bit_vector] -- exercises a parameterless function entity_tag that carries only a return type in its signature to disambiguate from other overloads sharing the same name
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ed_ret_only is
  port(
    clk   : in  bit;
    seed  : in  bit_vector(15 downto 0);
    rand  : out bit_vector(15 downto 0)
  );
end entity;

architecture rtl of ed_ret_only is
  attribute syn_keep : boolean;

  -- Overload #1: parameterless pseudo-random generator
  function f_gen return bit_vector is
    variable v : bit_vector(15 downto 0) := X"ACE1";
  begin
    v := v(14 downto 0) & (v(15) xor v(13) xor v(12) xor v(10));
    return v;
  end function;

  -- Overload #2: seeded generator with parameter
  function f_gen(init : bit_vector(15 downto 0)) return bit_vector is
    variable v : bit_vector(15 downto 0) := init;
  begin
    v := v(14 downto 0) & (v(15) xor v(13) xor v(12) xor v(10));
    return v;
  end function;

  -- entity_designator with signature [return bit_vector] for the parameterless overload
  attribute syn_keep of f_gen [return bit_vector] : function is true;

  signal state : bit_vector(15 downto 0) := X"5A5A";
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      state <= f_gen(state);
    end if;
  end process;
  rand <= state;
end architecture rtl;
