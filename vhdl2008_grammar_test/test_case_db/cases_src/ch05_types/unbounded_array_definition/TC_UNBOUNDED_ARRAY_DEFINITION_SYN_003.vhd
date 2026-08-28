-- =============================================================
-- Case ID: TC_UNBOUNDED_ARRAY_DEFINITION_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_UNBOUNDED_ARRAY_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: unbounded_array_definition ::=
--   array ( index_subtype_definition { , index_subtype_definition } )
--   of element_subtype_indication
-- Case Type: Positive
-- Test Focus: Unbounded array with enumeration-based
--            index_subtype_definition. A traffic light
--            sequencer with variable phase count.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity traffic_light_sequencer is
  port (
    clk      : in  bit;
    phase_in : in  integer range 0 to 3;
    red_l    : out bit;
    yel_l    : out bit;
    grn_l    : out bit
  );
end entity traffic_light_sequencer;

architecture rtl of traffic_light_sequencer is
  type tl_phase is (RED_PH, YEL_PH, GRN_PH, OFF_PH);
  -- unbounded_array_definition with enumeration index_subtype_definition
  type light_pattern is array (tl_phase range <>) of bit_vector(2 downto 0);
  subtype seq_pattern is light_pattern(RED_PH to OFF_PH);
  constant seq_table : seq_pattern := (
    RED_PH => "100", YEL_PH => "010", GRN_PH => "001", OFF_PH => "000"
  );
  signal phase : tl_phase;
begin
  phase <= RED_PH when phase_in = 0 else
           YEL_PH when phase_in = 1 else
           GRN_PH when phase_in = 2 else OFF_PH;
  red_l <= seq_table(phase)(2);
  yel_l <= seq_table(phase)(1);
  grn_l <= seq_table(phase)(0);
end architecture rtl;
