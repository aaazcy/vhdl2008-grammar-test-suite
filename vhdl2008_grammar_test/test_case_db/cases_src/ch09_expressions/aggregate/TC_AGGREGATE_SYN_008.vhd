-- =============================================================
-- Case ID: TC_AGGREGATE_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_AGGREGATE
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: aggregate ::= ( element_association { , element_association } )
-- Case Type: Positive
-- Test Focus: Aggregate used for process variable initialization — a variable declaration assigns the aggregate "(0, 1, 2, 3)" as its initial value, verifying the syntax of an aggregate as a default value in a variable declaration context
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ent_agg_variable is
  port (
    clk : in  bit;
    y_o : out integer
  );
end entity ent_agg_variable;

architecture rtl of ent_agg_variable is
  type t_int_arr is array(0 to 3) of integer;
begin
  process(clk)
    variable arr : t_int_arr := (0, 1, 2, 3);
    variable idx : integer range 0 to 3 := 0;
  begin
    if clk'event and clk = '1' then
      y_o <= arr(idx);
      if idx < 3 then idx := idx + 1; else idx := 0; end if;
    end if;
  end process;
end architecture rtl;
