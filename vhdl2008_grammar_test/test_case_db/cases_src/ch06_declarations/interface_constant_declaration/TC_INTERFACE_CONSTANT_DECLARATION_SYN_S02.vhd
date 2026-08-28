-- =============================================================
-- Case ID: TC_INTERFACE_CONSTANT_DECLARATION_SYN_S02
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTERFACE_CONSTANT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: interface_constant_declaration ::= [ constant ] identifier_list : [ in ] subtype_indication [ := static_expression ]
-- Case Type: Positive
-- Test Focus: Production-specific: interface_constant with explicit constant keyword and default static_expression as generic parameter.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity interface_constant_syn_s2 is
  generic (
    constant TIMEOUT_MS : integer := 100;
    constant RETRY_COUNT : integer := 3
  );
  port (
    clk      : in  bit;
    start    : in  bit;
    timed_out : out bit
  );
end entity interface_constant_syn_s2;

architecture rtl of interface_constant_syn_s2 is
  signal s_count : integer range 0 to TIMEOUT_MS := 0;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      if start = '1' then
        s_count <= 0;
      elsif s_count < TIMEOUT_MS then
        s_count <= s_count + 1;
      end if;
      timed_out <= '1' when s_count >= TIMEOUT_MS else '0';
    end if;
  end process;
end architecture rtl;
