-- =============================================================
-- Case ID: TC_VERIFICATION_UNIT_BINDING_INDICATION_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_VERIFICATION_UNIT_BINDING_INDICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.4
-- Production: verification_unit_binding_indication ::= use vunit verification_unit_list
-- Case Type: Positive
-- Test Focus: VUnit binding combined with complete generic map and port map — the verification_unit_binding_indication embedded in an entity binding configuration specification containing generic map and port map, verifies the "use vunit" clause can coexist with a complete binding_indication (with generic and port mappings) in the same compound configuration specification
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity data_register is
  generic(width : positive := 8);
  port(clk, rst : in bit; d : in bit_vector(width-1 downto 0); q : out bit_vector(width-1 downto 0));
end entity data_register;

architecture beh of data_register is
begin
end architecture beh;


entity vubi_syn4_ent is
  port(clk, rst : in bit; din : in bit_vector(7 downto 0); dout : out bit_vector(7 downto 0));
end entity vubi_syn4_ent;

architecture rtl of vubi_syn4_ent is
  component data_register is
    generic(width : positive := 8);
    port(clk, rst : in bit; d : in bit_vector(width-1 downto 0); q : out bit_vector(width-1 downto 0));
  end component data_register;
  for u_reg : data_register use entity work.data_register(beh)
    generic map(width => 8)
    port map(clk => clk, rst => rst, d => din, q => dout);
    use vunit reg_timing_validator;
  end for;
begin
  u_reg : data_register
    generic map(width => 8)
    port map(clk => clk, rst => rst, d => din, q => dout);
end architecture rtl;
