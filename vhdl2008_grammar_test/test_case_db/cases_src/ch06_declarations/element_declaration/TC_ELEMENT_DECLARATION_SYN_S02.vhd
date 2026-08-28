-- =============================================================
-- Case ID: TC_ELEMENT_DECLARATION_SYN_S02
-- Rule Type: Syntax
-- Related Rule ID: BNF_ELEMENT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.3
-- Production: element_declaration ::= identifier_list : element_subtype_definition ;
-- Case Type: Positive
-- Test Focus: Production-specific: exercises element_declaration within a record type definition for a complex bus protocol descriptor.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity element_decl_syn_s2 is
  port (
    clk   : in  bit;
    data  : in  bit_vector(15 downto 0);
    valid : out bit
  );
end entity element_decl_syn_s2;

architecture rtl of element_decl_syn_s2 is
  type t_bus_transaction is record
    address     : bit_vector(7 downto 0);
    read_write  : bit;
    burst_len   : integer range 1 to 16;
    data_payload : bit_vector(15 downto 0);
    parity      : bit;
  end record;
  signal s_trans : t_bus_transaction := (
    address => (others => '0'), read_write => '0',
    burst_len => 1, data_payload => (others => '0'), parity => '0'
  );
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      s_trans.data_payload <= data;
      s_trans.parity <= data(0) xor data(1) xor data(2) xor data(3)
                  xor data(4) xor data(5) xor data(6) xor data(7)
                  xor data(8) xor data(9) xor data(10) xor data(11)
                  xor data(12) xor data(13) xor data(14) xor data(15);
      valid <= '1';
    end if;
  end process;
end architecture rtl;
