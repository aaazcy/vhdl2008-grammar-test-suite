-- =============================================================
-- Case ID: TC_BASIC_IDENTIFIER_SYN_002
-- Rule Type: Syntax
-- BNF Production: BASIC_IDENTIFIER
-- IEEE Section: 15.4.2
-- BNF Text: basic_identifier ::= letter { [ underline ] letter_or_digit }
-- Test Focus: Basic identifiers containing embedded underscores for readability
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity basic_identifier_syn_002 is
  port (
    addr_bus_in  : in  bit_vector(15 downto 0);
    data_bus_out : out bit_vector(15 downto 0)
  );
end entity basic_identifier_syn_002;

architecture rtl of basic_identifier_syn_002 is
  -- Identifiers with underscores separating semantic components
  signal mem_read_data  : bit_vector(15 downto 0);
  signal mem_write_mask : bit_vector(15 downto 0);
  constant ADDR_DECODE_MASK : bit_vector(15 downto 0) := X"FF00";
begin
  mem_read_data  <= addr_bus_in and ADDR_DECODE_MASK;
  mem_write_mask <= not ADDR_DECODE_MASK;
  data_bus_out   <= mem_read_data;
end architecture rtl;
