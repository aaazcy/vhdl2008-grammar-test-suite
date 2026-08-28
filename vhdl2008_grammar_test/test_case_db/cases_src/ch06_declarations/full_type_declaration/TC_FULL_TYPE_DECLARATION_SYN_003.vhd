-- =============================================================
-- Case ID: TC_FULL_TYPE_DECLARATION_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_FULL_TYPE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.2
-- Production: full_type_declaration ::= type identifier is type_definition ;
-- Case Type: Positive
-- Test Focus: Exercises full_type_declaration with an unconstrained array type and a constrained subtype derived from it.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity full_type_decl_syn3 is
  port (
    clk : in bit;
    d   : in bit_vector(7 downto 0);
    q   : out bit_vector(7 downto 0)
  );
end entity full_type_decl_syn3;

architecture rtl of full_type_decl_syn3 is
  type t_unconstrained_vec is array(natural range <>) of bit;
  subtype t_byte is t_unconstrained_vec(7 downto 0);
  signal s_reg : t_byte := (others => '0');
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      s_reg <= t_byte(d);
    end if;
  end process;
  q <= bit_vector(s_reg);
end architecture rtl;
