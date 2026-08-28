-- =============================================================
-- Case ID: TC_COMPOSITE_TYPE_DEFINITION_SYN_S01
-- Rule Type: Syntax
-- Related Rule ID: BNF_COMPOSITE_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.1
-- Production: composite_type_definition ::= array_type_definition
--              | record_type_definition
-- Case Type: Positive (Production-Specific)
-- Test Focus: Direct test of both alternatives (array and record)
--            in composite_type_definition. A SPI peripheral model
--            uses both an array (shift register) and a record
--            (config), exercising the production choice.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity spi_peripheral is
  port (
    sclk    : in  bit;
    mosi    : in  bit;
    miso    : out bit;
    cs_n    : in  bit
  );
end entity spi_peripheral;

architecture rtl of spi_peripheral is
  -- composite: array_type_definition
  type shift_reg is array (7 downto 0) of bit;
  -- composite: record_type_definition
  type spi_config is record
    cpol : bit;
    cpha : bit;
    lsb_first : bit;
  end record;
  signal sr   : shift_reg := (others => '0');
  signal cfg  : spi_config := (cpol => '0', cpha => '0', lsb_first => '0');
  signal bit_cnt : integer range 0 to 7 := 7;
begin
  process(sclk)
  begin
    if cs_n = '0' then
      if sclk'event and sclk = '1' then
        sr(bit_cnt) <= mosi;
        if bit_cnt = 0 then bit_cnt <= 7;
        else bit_cnt <= bit_cnt - 1; end if;
      end if;
    end if;
  end process;
  miso <= sr(7) when cs_n = '0' else '0';
end architecture rtl;
