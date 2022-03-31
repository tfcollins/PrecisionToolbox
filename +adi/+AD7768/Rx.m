classdef Rx < matlab.system.mixin.CustomIcon & adi.common.Rx ...
        & matlabshared.libiio.base & adi.common.Attribute
    %AD7768 Precision ADC Class
    
    properties (Nontunable)
        %SampleRate Sample Rate
        %   Baseband sampling rate in Hz, specified as a scalar
        %   in samples per second. Options are:
        %   '256000','128000','64000','32000','16000','8000','4000',
        %   '2000','1000'
        SampleRate = '256000';
        %SamplesPerFrame Samples Per Frame
        %   Number of samples per frame, specified as an even positive
        %   integer.
        SamplesPerFrame = 16;
    end
    
    properties(Nontunable, Hidden, Constant)
        channel_names = {...
            'voltage0'};
    end
    
    properties (Hidden, Nontunable, Access = protected)
        isOutput = false;
    end
    
    properties(Constant, Hidden)
        SampleRateSet = matlab.system.StringSet({ ...
            '256000','128000','64000','32000','16000','8000','4000','2000','1000'});
        
    end
    
    properties(Nontunable, Hidden)
        Timeout = Inf;
        kernelBuffersCount = 2;
        dataTypeStr = 'int32';
        phyDevName = 'ad7768-1';
        devName = 'ad7768-1';
    end
    
    properties(Nontunable, Hidden, Constant)
        Type = 'Rx';
        DACBufferGain = 1.22;
        G = 0.3;
        FDAGain = 2.667;
        FDAVocmMv = 2500;
    end
    
    properties (Hidden, Constant)
        ComplexData = false;
    end
    
    properties (Hidden)
        gpio;
        ltc2606;
        ltc2308;
    end
    
    methods
        %% Constructor
        function obj = Rx(varargin)
            obj = obj@matlabshared.libiio.base(varargin{:});
            obj.enableExplicitPolling = false;
            obj.EnabledChannels = 1;
            obj.BufferTypeConversionEnable = true;
            obj.uri = 'ip:analog';
        end
        function flush(obj)
            flushBuffers(obj);
        end
        % Check SamplingRate
        function set.SampleRate(obj, value)
            obj.SampleRate = value;
            if obj.ConnectedToDevice
                obj.setDeviceAttributeRAW('sampling_frequency',value);
            end
        end
        
    end
    
    methods (Access=protected)
        
        function numOut = getNumOutputsImpl(~)
            numOut = 1;
        end
        
    end
    
    %% Sensor specific APIs
    methods
    end
    
    %% API Functions
    methods (Hidden, Access = protected)
                
        function setupInit(obj)
            % Write all attributes to device once connected through set
            % methods
            % Do writes directly to hardware without using set methods.
            % This is required sine Simulink support doesn't support
            % modification to nontunable variables at SetupImpl
            
            obj.setDeviceAttributeRAW('sampling_frequency',num2str(obj.SampleRate));
            
        end        
    end
    
    %% External Dependency Methods
    methods (Hidden, Static)
        
        function tf = isSupportedContext(bldCfg)
            tf = matlabshared.libiio.ExternalDependency.isSupportedContext(bldCfg);
        end
        
        function updateBuildInfo(buildInfo, bldCfg)
            % Call the matlabshared.libiio.method first
            matlabshared.libiio.ExternalDependency.updateBuildInfo(buildInfo, bldCfg);
        end
        
        function bName = getDescriptiveName(~)
            bName = 'AD7768 Precision ADC';
        end
        
    end
end

