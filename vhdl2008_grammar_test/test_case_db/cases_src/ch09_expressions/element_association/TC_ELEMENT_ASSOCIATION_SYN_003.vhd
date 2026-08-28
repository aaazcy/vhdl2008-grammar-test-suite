-- =============================================================
-- Case ID: TC_ELEMENT_ASSOCIATION_SYN_003
-- Rule Type: Syntax
-- BNF Production: element_association
-- IEEE Section: 9.3.3.1
-- BNF Text: element_association ::= [ choices => ] expression
-- Test Focus: 'others' choice in aggregate element association for a large reset initialization
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_element_association_syn_003 is
  port (
    clk    : in  bit;
    rst_n  : in  bit;
    addr   : in  bit_vector(7 downto 0);
    data   : out bit_vector(7 downto 0)
  );
end entity tc_element_association_syn_003;

architecture memory of tc_element_association_syn_003 is
  type t_mem is array(0 to 255) of bit_vector(7 downto 0);
  signal mem : t_mem := (others => X"00");  -- others choice for all elements
  signal addr_int : integer range 0 to 255;
begin
  addr_int <= 0 when rst_n = '0' else 0;  -- placeholder for addr conversion

  process(clk)
  begin
    if clk'event and clk = '1' then
      if rst_n = '0' then
        -- Named + others mixed in reset aggregate
        mem <= (0 => X"FF", 1 => X"EE", others => X"00");
      end if;
    end if;
  end process;

  data <= mem(0);
end architecture memory;
