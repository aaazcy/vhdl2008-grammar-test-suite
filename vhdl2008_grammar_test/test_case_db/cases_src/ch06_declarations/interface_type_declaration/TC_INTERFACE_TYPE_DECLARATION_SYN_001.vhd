-- =============================================================
-- Case ID: TC_INTERFACE_TYPE_DECLARATION_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTERFACE_TYPE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.5
-- Production: interface_type_declaration ::= interface_incomplete_type_declaration
-- Case Type: Positive
-- Test Focus: Exercises interface_type_declaration through an incomplete type in a generic interface for a data structure.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity interface_type_decl_syn1 is
  generic (
    type t_element
  );
  port (
    clk   : in  bit;
    data  : in  integer;
    valid : out bit
  );
end entity interface_type_decl_syn1;

architecture rtl of interface_type_decl_syn1 is
  signal s_valid : bit := '0';
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      s_valid <= not s_valid;
    end if;
  end process;
  valid <= s_valid;
end architecture rtl;
