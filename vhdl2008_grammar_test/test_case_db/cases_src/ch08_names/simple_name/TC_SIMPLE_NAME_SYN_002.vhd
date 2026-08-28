-- =============================================================
-- Case ID: TC_SIMPLE_NAME_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIMPLE_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.1
-- Production: simple_name ::= identifier
-- Case Type: Positive
-- Test Focus: simple_name as identifier in multiple declaration contexts — signal names, variable names, constant names, type names, subtype names all exercise simple_name as the identifier referencing a declared object
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity simple_name_ctx_ent is
  port(clk : in bit; addr : in integer range 0 to 15; data_out : out bit_vector(7 downto 0));
end entity;

architecture bh of simple_name_ctx_ent is
  type rom_type is array(0 to 15) of bit_vector(7 downto 0);
  constant rom_init : rom_type := (0=>X"00", 1=>X"11", 2=>X"22", 3=>X"33", 4=>X"44", others=>X"FF");
  signal rom_data : rom_type := rom_init;
  signal addr_reg : integer range 0 to 15 := 0;
  signal data_reg : bit_vector(7 downto 0) := X"00";
begin
  process(clk)
    variable v_addr : integer range 0 to 15;
  begin
    if clk'event and clk = '1' then
      v_addr := addr;
      data_reg <= rom_data(v_addr);
      addr_reg <= v_addr;
    end if;
  end process;
  data_out <= data_reg;
end architecture bh;
